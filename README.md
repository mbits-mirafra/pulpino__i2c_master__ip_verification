# pulpino__i2c_master__ip_verification
IP Verification of I2C master using the I3C VIP


### IP Verification of Pulpino I2C Master using the I3C VIP

### Block Diagram  
![image](https://github.com/mbits-mirafra/pulpino__i2c_master__ip_verification/assets/106074838/2fc6d151-9bd1-4d8c-b766-bafb54014bb1)


### Key Features of RTL 
1. It supports a two-wire serial interface.
2. Multi-master operation
3. Programmable clock frequency
4. Interrupt or bit-polling-driven byte-by-byte data transfer 
5. Start, Stop, repeated Start, Acknowledge generation
6. Bus busy detection
7. Legacy I2C Device coexistence on the same bus
8. Support 7-bit Addressing mode


### Testbench Architecture Diagram
![image](https://github.com/mbits-mirafra/pulpino__i2c_master__ip_verification/assets/106074838/a23bb03d-7f8b-4faa-8859-6ff6ed81785b)



### Developers, Welcome
We believe in growing together and if you'd like to contribute, please do check out the contributing guide below:  
https://github.com/mbits-mirafra/pulpino__i2c_master__ip_verification/blob/main/contribution_guidelines.md


### Installation - Get the VIP collateral from the GitHub repository

```
# Checking for git software, open the terminal type the command
git version

# Get the VIP collateral
git clone git@github.com:mbits-mirafra/pulpino__i2c_master__ip_verification.git
```

### Running the test

#### Using Mentor's Questasim simulator 

```
cd pulpino__i2c_master__ip_verification/sim/questasim

# Compilation:  
make compile

# Simulation:
make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>

ex: make simulate test=pulpino_i2c_master_ip_basic_write_test uvm_verbosity=UVM_HIGH

# Note: You can find all the test case names in the path given below   
pulpino__i2c_master__ip_verification/src/hvl_top/testlists/pulpino_i2c_master_ip_verification_regression.list

# Wavefrom:  
vsim -view <test_name>/waveform.wlf &

ex: vsim -view pulpino_i2c_master_ip_basic_write_test/waveform.wlf &

# Regression:
make regression testlist_name=<regression_testlist_name.list>
ex: make regression testlist_name=pulpino_i2c_master_ip_verification_regression.list

# Coverage: 
 ## Individual test:
 firefox <test_name>/html_cov_report/index.html &
 ex: firefox pulpino_i2c_master_ip_basic_write_test/html_cov_report/index.html &

 ## Regression:
 firefox merged_cov_html_report/index.html &

```


#### Using Cadence's Xcelium simulator 

```
cd pulpino__i2c_master__ip_verification/sim/cadence_sim

# Compilation:  
make compile

# Simulation:
make simulate test=<test_name> uvm_verbosity=<VERBOSITY_LEVEL>

make simulate test=pulpino_i2c_master_ip_basic_write_test uvm_verbosity=UVM_HIGH 

# Note: You can find all the test case names in the path given below   
pulpino__i2c_master__ip_verification/src/hvl_top/testlists/pulpino_i2c_master_ip_verification_regression.list

# Wavefrom:  
simvision waves.shm/ &

# Regression:
make regression testlist_name=<regression_testlist_name.list>
ex: make regression testlist_name=pulpino_i2c_master_ip_verification_regression.list

# Coverage:   
imc -load cov_work/scope/test/ &

```

### Technical Document 

https://docs.google.com/document/d/1ZiSF0E3bq1fM0sJDv_D75oV2MdA1mgEU1q4QouveBSE/


### Testbench Architecture Diagram of I3C_AVIP Project 
![image](https://github.com/mbits-mirafra/i3c_avip/assets/106074838/32227a76-6131-42aa-8a01-6db2b224aba1)

Follow the below link for I3C_AVIP Project  
https://github.com/mbits-mirafra/i3c_avip/tree/production

### Contact Mirafra Team  
You can reach out to us over mbits@mirafra.com

For more information regarding Mirafra Technologies please do checkout our officail website:  
https://mirafra.com/


