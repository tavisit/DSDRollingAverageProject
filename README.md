# Overview 
- The Design Assignment will be to develop a simple signal processing system that will calculate the rolling average of a parallel 8-bit data stream as a systems design exercise.  
- The design will be implemented on a self contained Xilinx/Digilent Spartan 3 XC3S200 FPGA board to allow demonstration of a working system. 
- The system will be developed as a VHDL model using Xilinx ISE WebPack Version 6.3 that includes the use of the Modelsim simulation tools for design verification.  
- Assessment will be based primarily on the records kept in individual logbooks supplemented by a short formal report of VHDL listings, system block diagrams and annotated simulation results. 
 
 
## The Task 
Within signal processing systems there is often the need to calculate the numerical average value for an input data stream. This implements a simple low pass filter - smoothing out rapid changes in value in the data stream but maintaining any overall trend. The greater the number of samples used to calculate the average the more smoothing will occur.  The filter system will be required to run in "real time" and output the average value at the same rate as the original input data. 
 
 
The task is to develop a VHDL based model for the "Digital Filter / Rolling Average" system combined with a data stream generator.  Switches, Buttons and the Seven Segment Display located on the Diligent S3 board will need to be included to demonstrate correct operation. 


The project was made by:
1. [Man Rares](https://github.com/hsujiq112)
2. [Matei Octavian](https://github.com/tavisit)
