`ifndef APB_MASTER_BASIC_READ_SEQ_INCLUDED_
`define APB_MASTER_BASIC_READ_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_basic_read_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_basic_read_seq extends apb_master_base_seq;
  `uvm_object_utils(apb_master_basic_read_seq)

  string clkPrescale_reg = "CLOCK_PRESCALE_REG_SEQ";
  string control_reg     = "CONTROL_REG_SEQ";
  string tx_reg          = "TX_REG_SEQ";
  string rx_reg          = "RX_REG_SEQ";
  string command_reg     = "COMMAND_REG_SEQ";
  string status_reg      = "STATUS_REG_SEQ";
 
  extern function new(string name ="apb_master_basic_read_seq");
  extern task body();

  endclass : apb_master_basic_read_seq

function apb_master_basic_read_seq::new(string name="apb_master_basic_read_seq");
  super.new(name);
endfunction : new

task apb_master_basic_read_seq::body();
  super.body();
  req=apb_master_tx::type_id::create("req");
  req.apb_master_agent_cfg_h = p_sequencer.apb_master_agent_cfg_h;

/*  
  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5000;
                            req.pwdata == 32'h0000_0006;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CPR
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(clkPrescale_reg,$sformatf("clkPrescale_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5004;
                            req.pwdata == 32'h0010_1080;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CTRL
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(control_reg,$sformatf("control_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5008;
                            req.pwdata == 32'hffff_0068;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : TXREG
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(tx_reg,$sformatf("tx_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);
*/

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_500c;
//                          req.pwdata == 32'h0fA9_ffff;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 1;
                            req.pwrite == READ;}) begin : RXREG
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(rx_reg,$sformatf("rx_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);
/* 

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5091;
                            req.pwdata == 32'h0008_0090;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : COMMAND
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(command_reg,$sformatf("command_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_5014;
                            req.pwdata == 32'hf000_0010;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : STATUS_REG
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(status_reg,$sformatf("status_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

*/
endtask : body

`endif
