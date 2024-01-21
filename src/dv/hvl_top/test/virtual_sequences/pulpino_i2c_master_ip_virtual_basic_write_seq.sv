`ifndef PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_WRITE_SEQ_INCLUDED_
`define PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_i2c_master_ip_virtual_basic_write_seq
// Creates and starts the master and target vd_vws sequnences of variable data and variable 
// wait states.
//--------------------------------------------------------------------------------------------
class pulpino_i2c_master_ip_virtual_basic_write_seq extends pulpino_i2c_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_i2c_master_ip_virtual_basic_write_seq)

  //Variable : apb_master_8b_seq_h
  //Instatiation of apb_master_8b_seq
  apb_master_basic_write_seq apb_master_basic_seq_h;

  //Variable : i3c_target_writeOperationWith8bitsData_seq_h 
  //Instantiation of i3c_target_writeOperationWith8bitsData_seq 
  i3c_target_writeOperationWith8bitsData_seq  i3c_target_writeOperationWith8bitsData_seq_h;
  
  //Variable : write_key
  //Used to provide access to perform write operation
  //semaphore write_key;

  event wr_rd;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="pulpino_i2c_master_ip_virtual_basic_write_seq");
  extern task body();

endclass : pulpino_i2c_master_ip_virtual_basic_write_seq
//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_i2c_master_ip_virtual_basic_write_seq
//--------------------------------------------------------------------------------------------

function pulpino_i2c_master_ip_virtual_basic_write_seq::new(string name ="pulpino_i2c_master_ip_virtual_basic_write_seq");
  super.new(name);
//  write_key = new(1);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates and starts the 8bit data of master and target sequences
//--------------------------------------------------------------------------------------------
task pulpino_i2c_master_ip_virtual_basic_write_seq::body();
  super.body();
  apb_master_basic_seq_h = apb_master_basic_write_seq::type_id::create("apb_master_basic_seq_h");
  i3c_target_writeOperationWith8bitsData_seq_h = i3c_target_writeOperationWith8bitsData_seq::type_id::create("i3c_target_writeOperationWith8bitsData_seq_h");

    fork
     forever begin
       `uvm_info("target_vseq",$sformatf("started target vseq"),UVM_HIGH)
     //  write_key.get(1);
       i3c_target_writeOperationWith8bitsData_seq_h.start(p_sequencer.i3c_target_seqr_h);
    //   write_key.put(1);
       -> wr_rd;
       `uvm_info("target_vseq",$sformatf("ended target vseq"),UVM_HIGH)
     end
   join_none
 

  repeat(1) begin
    `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
  //  write_key.get(1);
    apb_master_basic_seq_h.start(p_sequencer.apb_master_seqr_h);
   // GopalS:   wait(wr_rd.triggered);
 //   write_key.put(1);
    `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
  end

 endtask : body

`endif
