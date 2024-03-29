`ifndef PULPINO_I2C_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_
`define PULPINO_I2C_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_

//-----------------------------------------------------------------------------------------
// Package: pulpino_i2c_master_ip_base base_test
// Description:
// Includes all the files written to run the simulation
//--------------------------------------------------------------------------------------------
package pulpino_i2c_master_ip_test_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import apb_master_global_pkg::*;
  import i3c_target_global_pkg::*;

  import apb_master_pkg::*;
  import i3c_target_pkg::*;

  import pulpino_i2c_master_ip_env_pkg::*;

  import apb_master_seq_pkg::*;
  import i3c_target_seq_pkg::*;
  import pulpino_i2c_master_ip_virtual_seq_pkg::*;
  
  //-------------------------------------------------------
  // Including the base_test files
  //-------------------------------------------------------
  `include "pulpino_i2c_master_ip_base_test.sv"
  `include "pulpino_i2c_master_ip_basic_write_test.sv"
  `include "pulpino_i2c_master_ip_basic_read_test.sv"
  `include "pulpino_i2c_master_ip_basic_transaction_test.sv"
  `include "pulpino_i2c_master_ip_basicWriteFollowedByRead_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_basic_write_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_basic_read_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_0_cmd_0_addr_32_data_length_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_0_cmd_32_addr_32_data_length_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_32_cmd_32_addr_32_data_length_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_8_cmd_8_addr_32_data_length_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_0_dummy_write_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_8_dummy_write_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_16_dummy_write_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_even_clkdiv_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_odd_clkdiv_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_thtx_rhtx_cnttx_cntrx_value_2_test.sv"
  // MSHA: `include "pulpino_i2c_master_ip_std_mode_write_thtx_rhtx_cnttx_cntrx_value_4_test.sv"

  // MSHA: `include "pulpino_i2c_master_ip_rand_test.sv"

  endpackage : pulpino_i2c_master_ip_test_pkg

`endif
