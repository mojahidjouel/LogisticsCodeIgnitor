<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Service_apply extends My_Controller {
	protected $table="service_apply";
	public function __construct(){
		Parent::__construct();
		$this->load->model('Common_model','cm');
	}
	
	public function index(){
		$data=$this->db->query("SELECT service_apply.*,(SELECT name from city WHERE city.id=service_apply.to_city) as to_city_name,(SELECT name from city WHERE city.id=service_apply.from_city) as from_city_name FROM `service_apply`")->result_array();
		$status=0;
		if($data)
			$status=1;

		$this->sendJSON($data,$status);
	}
	
	public function create(){
		$data = json_decode(file_get_contents("php://input"),true);
		//print_r($data);die();
		if($data){
			if($data['from_city']==""){
				$message=array('message'=>'From City is required');
				$this->sendJSON($message,0);
			}else if($data['to_city']==""){
				$message=array('message'=>'To City is required');
				$this->sendJSON($message,0);
			}else{
				if($data['id']==""){
					$data['created_at']=date('Y-m-d H:i:s');
					unset($data['id']);
					$rs=$this->cm->insert($this->table,$data);
				}else{
					unset($data['from_city_name']);
					unset($data['to_city_name']);
					$data['updated_at']=date('Y-m-d H:i:s');
					$condition['id']=$data['id'];
					$rs=$this->cm->update($this->table,$data,$condition);
				}
				if($rs){
					$message=array('message'=>'Data has been saved.');
					$status=1;
				}else{
					$message=array('message'=>'Data has not been saved. Please try again');
					$status=0;
				}
			}
		}else{
			$message=array('message'=>'You have to provide data to save');
			$status=0;
		}
		$this->sendJSON($message,$status);
	}

	public function delete($id){
		$data['id']=$id;
		if($this->cm->delete($this->table,$data)){
			$message=array('message'=>'Data deleted');
			$status=1;
		}else{
			$message=array('message'=>'Please try again');
			$status=0;
		}
		$this->sendJSON($message,$status);
	}
}
