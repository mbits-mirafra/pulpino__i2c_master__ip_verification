`ifndef PULPINO_I2C_MASTER_IP_ENV_INCLUDED_
`define PULPINO_I2C_MASTER_IP_ENV_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_i2c_master_ip_env
// Creates master agent and slave agent and scoreboard
//--------------------------------------------------------------------------------------------
class pulpino_i2c_master_ip_env extends uvm_env;
  `uvm_component_utils(pulpino_i2c_master_ip_env)

  //Declaring apb master agent handle
  apb_master_agent apb_master_agent_h;

  //Declaring i3c target agent handle
  i3c_target_agent i3c_target_agent_h[];

  //Declaring pulpino_i2c_master_ip scoreboard handle
  pulpino_i2c_master_ip_scoreboard pulpino_i2c_master_ip_scoreboard_h;

  //Declaring apb virtual seqr handle
  pulpino_i2c_master_ip_virtual_sequencer pulpino_i2c_master_ip_virtual_seqr_h;
  
  //Declaring handle for pulpino_i2c_master_ip_env_config_object
  pulpino_i2c_master_ip_env_config pulpino_i2c_master_ip_env_config_h;  
  
  // Variable: apb_master_coll_h;
  // Handle for apb master collector
  // GopalS: apb_master_collector apb_master_coll_h;

  // Variable: i3c_target_coll_h;
  // Handle for i3c target collector
  // GopalS: i3c_target_collector i3c_target_coll_h;


  extern function new(string name = "pulpino_i2c_master_ip_env", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : pulpino_i2c_master_ip_env


function pulpino_i2c_master_ip_env::new(string name = "pulpino_i2c_master_ip_env",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void pulpino_i2c_master_ip_env::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if(!uvm_config_db #(pulpino_i2c_master_ip_env_config)::get(this,"","pulpino_i2c_master_ip_env_config",pulpino_i2c_master_ip_env_config_h)) begin
   `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Couldn't get the env_config from config_db"))
  end
  
  apb_master_agent_h = apb_master_agent::type_id::create("apb_master_agent",this);
  
  i3c_target_agent_h = new[pulpino_i2c_master_ip_env_config_h.no_of_i3c_targets];
  foreach(i3c_target_agent_h[i]) begin
    i3c_target_agent_h[i] = i3c_target_agent::type_id::create($sformatf("i3c_target_agent_h[%0d]",i),this);
  end

  if(pulpino_i2c_master_ip_env_config_h.has_virtual_seqr) begin
    pulpino_i2c_master_ip_virtual_seqr_h = pulpino_i2c_master_ip_virtual_sequencer::type_id::create("pulpino_i2c_master_ip_virtual_seqr_h",this);
  end

  if(pulpino_i2c_master_ip_env_config_h.has_scoreboard) begin
    pulpino_i2c_master_ip_scoreboard_h = pulpino_i2c_master_ip_scoreboard::type_id::create("pulpino_i2c_master_ip_scoreboard_h",this);
  end

  // GopalS: apb_master_coll_h = apb_master_collector::type_id::create("apb_master_coll_h",this);
  // GopalS: i3c_target_coll_h  = i3c_target_collector::type_id::create("i3c_target_coll_h",this);

endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// Connects the master agent monitor's analysis_port with scoreboard's analysis_fifo 
// Connects the slave agent monitor's analysis_port with scoreboard's analysis_fifo 
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_i2c_master_ip_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(pulpino_i2c_master_ip_env_config_h.has_virtual_seqr) begin
    pulpino_i2c_master_ip_virtual_seqr_h.apb_master_seqr_h = apb_master_agent_h.apb_master_seqr_h;
    foreach(i3c_target_agent_h[i]) begin
      pulpino_i2c_master_ip_virtual_seqr_h.i3c_target_seqr_h = i3c_target_agent_h[i].i3c_target_seqr_h;
    end

    pulpino_i2c_master_ip_virtual_seqr_h.env_config_h = pulpino_i2c_master_ip_env_config_h; 
  end
 /* 
  apb_master_agent_h.apb_master_mon_proxy_h.apb_master_analysis_port.connect(apb_master_coll_h.apb_master_coll_imp_port);
  foreach(i3c_target_agent_h[i]) begin
    i3c_target_agent_h[i].i3c_target_mon_proxy_h.i3c_target_analysis_port.connect(i3c_target_coll_h.i3c_target_coll_imp_port);
  end

  apb_master_coll_h.apb_master_coll_analysis_port.connect(pulpino_i2c_master_ip_scoreboard_h.apb_master_analysis_fifo.analysis_export);
  i3c_target_coll_h.i3c_target_coll_analysis_port.connect(pulpino_i2c_master_ip_scoreboard_h.i3c_target_analysis_fifo.analysis_export);
  */

  apb_master_agent_h.apb_master_mon_proxy_h.apb_master_analysis_port.connect(pulpino_i2c_master_ip_scoreboard_h.apb_master_analysis_fifo.analysis_export);
  foreach(i3c_target_agent_h[i]) begin
    i3c_target_agent_h[i].i3c_target_mon_proxy_h.i3c_target_analysis_port.connect(pulpino_i2c_master_ip_scoreboard_h.i3c_target_analysis_fifo.analysis_export);
  end
endfunction : connect_phase

`endif

