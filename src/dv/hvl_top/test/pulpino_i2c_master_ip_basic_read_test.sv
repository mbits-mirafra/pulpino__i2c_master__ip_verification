`ifndef PULPINO_I2C_MASTER_IP_BASIC_READ_TEST_INCLUDED_
`define PULPINO_I2C_MASTER_IP_BASIC_READ_TEST_INCLUDED_

class pulpino_i2c_master_ip_basic_read_test extends pulpino_i2c_master_ip_base_test;
  `uvm_component_utils(pulpino_i2c_master_ip_basic_read_test)
  
 pulpino_i2c_master_ip_virtual_basic_read_seq pulpino_i2c_master_ip_virtual_basic_read_seq_h;

  extern function new(string name = "pulpino_i2c_master_ip_basic_read_test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : pulpino_i2c_master_ip_basic_read_test


function pulpino_i2c_master_ip_basic_read_test::new(string name = "pulpino_i2c_master_ip_basic_read_test",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task pulpino_i2c_master_ip_basic_read_test::run_phase(uvm_phase phase);
  
  pulpino_i2c_master_ip_virtual_basic_read_seq_h =
  pulpino_i2c_master_ip_virtual_basic_read_seq::type_id::create("pulpino_i2c_master_ip_virtual_basic_read_seq_h");

  `uvm_info(get_type_name(),$sformatf("pulpino_i2c_master_ip_basic_read_test"),UVM_LOW);
  phase.raise_objection(this);
  pulpino_i2c_master_ip_virtual_basic_read_seq_h.start(pulpino_i2c_master_ip_env_h.pulpino_i2c_master_ip_virtual_seqr_h); 
  phase.drop_objection(this);

endtask : run_phase

`endif
