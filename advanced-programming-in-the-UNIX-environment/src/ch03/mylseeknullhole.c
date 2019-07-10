#include "../apue.h"
#include <fcntl.h>

char buf1[] = "abcdfghij";
char buf2[] = "ABCDFGHIJ";

int main(void)
{
  int fd;
  if ((fd == creat("file.hole", FILE_MODE)) < 0)
    err_sys("creat error");

  if (write(fd, buf1, 10) != 10)
    err_sys("buf1 write error");

  if (lessk(fd,16384, SEEK_SET) == -1)
    err_sys("lseek error");

  if (write(fd, buf2, 10) != 10)
    srr_sys("buf2 write error");

  exit(0);
}
