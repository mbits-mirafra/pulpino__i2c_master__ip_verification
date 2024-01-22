`ifndef PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_TRANSACTION_SEQ_INCLUDED_
`define PULPINO_I2C_MASTER_IP_VIRTUAL_BASIC_TRANSACTION_SEQ_INCLUDED_

class pulpino_i2c_master_ip_virtual_basic_transaction_seq extends pulpino_i2c_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_i2c_master_ip_virtual_basic_transaction_seq)

  apb_master_basic_transaction_seq apb_master_basic_transaction_seq_h;
//  apb_master_basic_read_seq apb_master_basic_read_seq_h;

  i3c_target_writeOperationWith8bitsData_seq  i3c_target_writeOperationWith8bitsData_seq_h;
  event wr_rd;

  extern function new(string name ="pulpino_i2c_master_ip_virtual_basic_transaction_seq");
  extern task body();

endclass : pulpino_i2c_master_ip_virtual_basic_transaction_seq

function pulpino_i2c_master_ip_virtual_basic_transaction_seq::new(string name ="pulpino_i2c_master_ip_virtual_basic_transaction_seq");
  super.new(name);
//  transaction_key = new(1);
endfunction : new

task pulpino_i2c_master_ip_virtual_basic_transaction_seq::body();
  super.body();
  apb_master_basic_transaction_seq_h = apb_master_basic_transaction_seq::type_id::create("apb_master_basic_transaction_seq_h");
//  apb_master_basic_read_seq_h = apb_master_basic_read_seq::type_id::create("apb_master_basic_read_seq_h");
  i3c_target_writeOperationWith8bitsData_seq_h = i3c_target_writeOperationWith8bitsData_seq::type_id::create("i3c_target_writeOperationWith8bitsData_seq_h");

    fork
     forever begin
       `uvm_info("target_vseq",$sformatf("started target vseq"),UVM_HIGH)
     //  transaction_key.get(1);
       i3c_target_writeOperationWith8bitsData_seq_h.start(p_sequencer.i3c_target_seqr_h);
    //   transaction_key.put(1);
       -> wr_rd;
       `uvm_info("target_vseq",$sformatf("ended target vseq"),UVM_HIGH)
     end
   join_none
 

  repeat(1) begin
    `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
  //  transaction_key.get(1);
    apb_master_basic_transaction_seq_h.start(p_sequencer.apb_master_seqr_h);
 //   apb_master_basic_read_seq_h.start(p_sequencer.apb_master_seqr_h);
   // GopalS:   wait(wr_rd.triggered);
 //   transaction_key.put(1);
    `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
  end

 endtask : body

`endif
