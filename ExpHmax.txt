#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

int main(int argc, char ** argv)
{
  int fd;
  // Open the Port. We want read/write, no "controlling tty" status, and open it no matter what state DCD is in
  fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1)
        {
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
    return(-1);
        }

  // Turn off blocking for reads, use (fd, F_SETFL, FNDELAY) if you want that
  fcntl(fd, F_SETFL, 0);

struct termios options;
tcgetattr(fd, &options);
options.c_cflag = B9600 | CS8 | CLOCAL | CREAD;         //<Set baud rate
options.c_iflag = IGNPAR;
options.c_oflag = 0;
options.c_lflag = 0;
//tcflush(fd, TCIFLUSH);
tcsetattr(fd, TCSANOW, &options);
//cfsetispeed(&options, B9600);
//cfsetospeed(&options, B9600);
//tcsetattr(fd, TCSANOW, &options);
//while (1)
//{
  //int n = write(fd,"arun",5);
  //if (n < 0) {
    //perror("Write failed - ");
    //return -1;
while (1)
{
if (fd != -1)
        {
                // Read up to 255 characters from the port if they are there
                unsigned char rx_buffer[256];
                //unsigned char x;
                int rx_length = read(fd, (void*)rx_buffer,255);         //Filestream, buffer to store in, number of bytes to read (max)
                if (rx_length < 0)
                {
                        printf("Read Failed");
                        return -1;//An error occured (will occur if there are no bytes)
                }
                else if (rx_length == 0)
                {
                        printf("No data waiting\n");
                }
                else
                {
                        //Bytes received
                        rx_buffer[rx_length] = '0xed';
                        printf("Opening the port : %s\n", rx_buffer);
                        //x=atoh(rx_length);
                        //printf("number is%x\n", x);
                        sleep(2);
                }
        }

}





  // Don't forget to clean up
  close(fd);
  return 0;
}
