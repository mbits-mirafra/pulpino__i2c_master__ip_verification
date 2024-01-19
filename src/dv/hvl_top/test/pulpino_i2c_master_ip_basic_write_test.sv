`ifndef PULPINO_I2C_MASTER_IP_BASIC_WRITE_TEST_INCLUDED_
`define PULPINO_I2C_MASTER_IP_BASIC_WRITE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_8b_write_test
// Extends the base test and starts the virtual sequence
//--------------------------------------------------------------------------------------------
class pulpino_i2c_master_ip_basic_write_test extends pulpino_i2c_master_ip_base_test;
  `uvm_component_utils(pulpino_i2c_master_ip_basic_write_test)
  
  //Variable :pulpino_i2c_master_ip_virtual_basic_write_seq_h 
  //Instatiation of pulpino_i2c_master_ip_virtual_basic_write_seq
  pulpino_i2c_master_ip_virtual_basic_write_seq pulpino_i2c_master_ip_virtual_basic_write_seq_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_i2c_master_ip_basic_write_test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : pulpino_i2c_master_ip_basic_write_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_i2c_master_ip_basic_write_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_i2c_master_ip_basic_write_test::new(string name = "pulpino_i2c_master_ip_basic_write_test",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new


//--------------------------------------------------------------------------------------------
// Task: run_phase
// Creates the apb_virtual_8b_seq sequnce and starts the 8b virtual sequences
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task pulpino_i2c_master_ip_basic_write_test::run_phase(uvm_phase phase);
  
  pulpino_i2c_master_ip_virtual_basic_write_seq_h = pulpino_i2c_master_ip_virtual_basic_write_seq::type_id::create("pulpino_i2c_master_ip_virtual_basic_write_seq_h");

  `uvm_info(get_type_name(),$sformatf("pulpino_i2c_master_ip_basic_write_test"),UVM_LOW);
  phase.raise_objection(this);
  pulpino_i2c_master_ip_virtual_basic_write_seq_h.start(pulpino_i2c_master_ip_env_h.pulpino_i2c_master_ip_virtual_seqr_h); 
  phase.drop_objection(this);

endtask : run_phase

`endif
