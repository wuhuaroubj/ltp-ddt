/*
 * st_filesystem_parser.c
 *
 * This file contains filesystem parser and gives user selectable test cases
 *
 * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/ 
 * 
 * 
 *  Redistribution and use in source and binary forms, with or without 
 *  modification, are permitted provided that the following conditions 
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright 
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the   
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
*/

/*Testcode related header files */
#include "st_filesystem_common.h"
#include "st_filesystem_parser.h"

#include <st_timer.h>

char *testcaseid = "filesystemTests";
char *testname = "performance_tests";

/* Test case options structure */
extern struct st_filesystem_testparams testoptions;

/*Function to display test suite version */
void st_display_filesystem_testsuite_version();

/*
 * Function		- st_process_filesystem_test_options 
 * Functionality	- This function parses the command line options and values passed for the options
 * Input Params	-  argc,argv
 * Return Value	-  None
 * Note			-  None
 */

static int st_process_filesystem_test_options(int argc, char **argv)
{
	int error = TRUE;
	int version = FALSE;
	int help = FALSE;
	int result = FAILURE;
	for (;;) {
		int option_index = 0;
	/** Options for getopt - New test case options added need to be
         * populated here*/
		static struct option long_options[] = {
			{"file", required_argument, NULL, OPTION_FILE},
			{"src_file", required_argument, NULL, OPTION_SRC},
			{"dst_file", required_argument, NULL, OPTION_DST},
			{"duration", required_argument, NULL, OPTION_DURATION},
			{"buffer_size", required_argument, NULL,
			 OPTION_BUFFER_SIZE},
			{"file_size", required_argument, NULL,
			 OPTION_FILE_SIZE},
			{"id", required_argument, NULL, OPTION_TESTCASE_ID},
			{"read", no_argument, NULL, OPTION_READ},
			{"write", no_argument, NULL, OPTION_WRITE},
			{"copy", no_argument, NULL, OPTION_COPY},
			{"performance", optional_argument, NULL,
			 OPTION_PERFORMANCE},
			{"version", no_argument, NULL, OPTION_VERSION},
			{"help", no_argument, NULL, OPTION_HELP},
			{NULL, 0, NULL, 0}
		};
		int c = getopt_long_only(argc, argv,
					 "vh",
					 long_options, &option_index);
		if (c == -1) {
			break;
		}
		if (c == '?') {
			error = TRUE;
			break;
		}

		switch (c) {
		case OPTION_FILE:
			error = FALSE;
			if (optarg != NULL) {
				testoptions.filename = optarg;
			} else if (optind < argc && ('-' != argv[optind][0])) {
				testoptions.filename = argv[optind];
			}
			break;
                case OPTION_SRC:
                        error = FALSE;
                        if (optarg != NULL) {
                                testoptions.src = optarg;
                        } else if (optind < argc && ('-' != argv[optind][0])) {
                                testoptions.src = argv[optind];
                        }
                        break;
                case OPTION_DST:
                        error = FALSE;
                        if (optarg != NULL) {
                                testoptions.dst = optarg;
                        } else if (optind < argc && ('-' != argv[optind][0])) {
                                testoptions.dst = argv[optind];
                        }
                        break;
                case OPTION_DURATION:
                        if (optarg != NULL) {
                                testoptions.duration = atoi(optarg);
                        } else if (optind < argc && ('-' != argv[optind][0])) {
                                testoptions.duration = atoi(argv[optind]);
                        }
                        break;
		case OPTION_BUFFER_SIZE:
			if (optarg != NULL) {
				testoptions.buffer_size = atoi(optarg);
			} else if (optind < argc && ('-' != argv[optind][0])) {
				testoptions.buffer_size = atoi(argv[optind]);
			}
			break;
		case OPTION_FILE_SIZE:
			if (optarg != NULL) {
				testoptions.file_size = atoi(optarg);
			} else if (optind < argc && ('-' != argv[optind][0])) {
				testoptions.file_size = atoi(argv[optind]);
			}
			break;

		case OPTION_TESTCASE_ID:
			if (optarg != NULL) {
				testcaseid = optarg;
			} else if (optind < argc && ('-' != argv[optind][0])) {
				testcaseid = argv[optind];
			}
			break;

		case OPTION_READ:
			testoptions.iomode = 'r';
			break;

		case OPTION_WRITE:
			testoptions.iomode = 'w';
			break;
                case OPTION_COPY:
                        testoptions.iomode = 'c';
                        break;
		case OPTION_PERFORMANCE:
			testoptions.throughput_flag = TRUE;
			testoptions.cpuload_flag = TRUE;
			if (optarg != NULL) {
				if (strcmp(optarg, THROUGHPUT) == 0) {
					testoptions.throughput_flag = TRUE;
					testoptions.cpuload_flag = FALSE;
				} else if (strcmp(optarg, CPULOAD) == 0) {
					testoptions.throughput_flag = FALSE;
					testoptions.cpuload_flag = TRUE;
				}
			} else if (optind < argc && ('-' != argv[optind][0])) {
				if (strcmp(argv[optind], THROUGHPUT) == 0) {
					testoptions.throughput_flag = TRUE;
					testoptions.cpuload_flag = FALSE;
				} else if (strcmp(argv[optind], CPULOAD) == 0) {
					testoptions.throughput_flag = FALSE;
					testoptions.cpuload_flag = TRUE;
				}
			}

			break;

		case OPTION_VERSION:
			version = TRUE;
			st_display_filesystem_testsuite_version();
			break;

		case OPTION_HELP:
			help = TRUE;
			break;

		}
	}

	if (error == TRUE || help == TRUE) {
		if (version)
			exit(0);
		else
			st_display_filesystem_test_suite_help();
		if( error == TRUE)
			result = FAILURE;
	}
	else
	{
		st_print_filesystem_test_params(&testoptions, testcaseid);
		if (testoptions.iomode == 'r')
			result =
			    st_filesystem_performance_read_test(&testoptions,
							testcaseid);
		else if(testoptions.iomode == 'w')
			result =
			    st_filesystem_performance_write_test(&testoptions,
							 testcaseid);
		else
	                result =
	                    st_filesystem_performance_copy_test(&testoptions,
	                                                         testcaseid);
		TEST_PRINT_TST_RESULT(result, testcaseid);
		TEST_PRINT_TST_END(testcaseid);
	}
	return result;
}

/*
 * Function            	 	- st_display_filesystem_testsuite_version
 * Functionality       	- This function displays the test suite version
 * Input Params         	- None 
 * Return Value         	- None
 * Note                 		- None
 */

void st_display_filesystem_testsuite_version()
{
	printf("File system TestSuite V %s\n", VERSION_STRING);
}

/*
 * Function             	- Main function
 * Functionality       	- This is where the execution begins
 * Input Params      	- argc,argv
 * Return Value         	- None
 * Note                 		- None
 */

int main(int argc, char *argv[])
{
	/* Initialize options with default vales */
	st_init_filesystem_test_params();

	/* Initialize Timer module */
	init_timer_module();

	/* Invoke the parser function to process the command line options */
	return st_process_filesystem_test_options(argc, argv);

}
