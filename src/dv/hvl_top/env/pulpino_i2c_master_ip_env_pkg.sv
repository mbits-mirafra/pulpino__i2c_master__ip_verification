`ifndef PULPINO_I2C_MASTER_IP_ENV_PKG_INCLUDED_
`define PULPINO_I2C_MASTER_IP_ENV_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: pulpino_i2c_master_ip_env_pkg
// Includes all the files related to pulpino_i2c_master_ip env
//--------------------------------------------------------------------------------------------
package pulpino_i2c_master_ip_env_pkg;
  
  //-------------------------------------------------------
  // Importing uvm packages
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import apb_master_global_pkg::*;
  import i3c_target_global_pkg::*;
  import pulpino_i2c_master_ip_global_pkg::*;
  import apb_master_pkg::*;
  import i3c_target_pkg::*;
 // GopalS:  import i2c_master_defines_pkg::*;
  // GopalS: import i2c_master_uvm_pkg::*;

  //-------------------------------------------------------
  // Including the required files
  //-------------------------------------------------------
   `include "pulpino_i2c_master_ip_env_config.sv"
// GopalS:   `include "apb_reg_predictor.sv"
   `include "pulpino_i2c_master_ip_virtual_sequencer.sv"
   `include "pulpino_i2c_master_ip_scoreboard.sv"
   `include "apb_master_collector.sv"
   `include "i3c_target_collector.sv"
   `include "pulpino_i2c_master_ip_env.sv"

endpackage : pulpino_i2c_master_ip_env_pkg

`endif
