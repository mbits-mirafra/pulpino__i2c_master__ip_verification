# pulpino__i2c_master__ip_verification
IP Veriification of I2C master using the I3C VIP

# IP Verification of Pulpino I2C Master using the I3C VIP

# Block Diagram
![image](https://github.com/mbits-mirafra/pulpino__i2c_master__ip_verification/assets/106074838/2fc6d151-9bd1-4d8c-b766-bafb54014bb1)

# Key Features of RTL 
1.
2. 


# Testbench Architecture Diagram


# Developers, Welcome
We believe in growing together and if you'd like to contribute, please do check out the contributing guide below:  


# Installation - Get the VIP collateral from the GitHub repository

```
# Checking for git software, open the terminal type the command
git version

# Get the VIP collateral
git clone git@github.com:mbits-mirafra/pulpino__i2c_master__ip_verification.git
```

# Running the test

### Using Mentor's Questasim simulator 

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



```

### Using Cadence's Xcelium simulator 

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

## Technical Document 


## User Guide  


## Contact Mirafra Team  
You can reach out to us over mbits@mirafra.com

For more information regarding Mirafra Technologies please do checkout our officail website:  
https://mirafra.com/
