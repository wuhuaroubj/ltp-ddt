/*
 * st_filesystem_common.h
 *
 * This file contains common definions
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

#ifndef _ST_FILESYSTEM_COMMON_H_
#define _ST_FILESYSTEM_COMMON_H_

/*Generic header files */
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <fcntl.h>

/*Testcode related Header files*/
#include <st_defines.h>
#include <st_log.h>

/*Structure for holding the test options */
struct st_filesystem_testparams {
	/* i/o direction read/write */
	char iomode;
	/* Name of the file to read from or write to */
	char *filename;
	/* Buffer size */
	int buffer_size;
	/* File size */
	int file_size;
	/* Test name */
	char *test_name;
	/* throughput enable flag */
	int throughput_flag;
	/* cpuload enable flag */
	int cpuload_flag;
        /* Path of the file to read for copy */
        char *src;
        /* Path of the file write to for copy*/
        char *dst;
	/* duration */
	int duration;
};
void st_perror(const char *s);
Int32 st_read(IN Int32 fd, IN void *buf, IN Int32 count);
Int32 st_write(IN Int32 fd, IN const void *buf, IN Int32 count);
Int32 st_open(IN const Int8 * pathname, IN Int32 oflag);
Int32 st_close(IN Int32 fd);
void st_init_filesystem_test_params();
void st_display_filesystem_test_suite_help(void);
void st_print_filesystem_test_params(struct st_filesystem_testparams
				     *testoptions, char *test_id);
int st_filesystem_performance_read_test(struct st_filesystem_testparams *info,
					char *test_id);
int st_filesystem_performance_write_test(struct st_filesystem_testparams *info,
					 char *test_id);
int st_filesystem_performance_copy_test(struct st_filesystem_testparams *info,
                                         char *test_id);

#endif /*ST_FILESYSTEM_COMMON_H_ */
