#include <fcntl.h>
int open(const char *path, int oflag,...);
int openat(int fd, const char *path, int oflag,...)