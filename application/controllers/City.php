<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class City extends My_Controller {

	public function __construct(){
		Parent::__construct();
		$this->load->model('Common_model','cm');
	}
	
	public function index(){
		$data=$this->cm->retriveResult('city');
		$status=0;
		if($data)
			$status=1;

		$this->sendJSON($data,$status);
	}

	public function create(){
		$data = json_decode(file_get_contents("php://input"),true);
		
		if($data){
			if($data['name']==""){
				$message=array('message'=>'name is required');
				$this->sendJSON($message,0);
			}else{
				if($data['id']==""){
					$data['created_at']=date('Y-m-d H:i:s');
					unset($data['id']);
					$rs=$this->cm->insert('city',$data);
					
				}else{
					$data['updated_at']=date('Y-m-d H:i:s');
					$condition['id']=$data['id'];
					$rs=$this->cm->update('city',$data,$condition);
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
		if($this->cm->delete('city',$data)){
			$message=array('message'=>'Data deleted');
			$status=1;
		}else{
			$message=array('message'=>'Please try again');
			$status=0;
		}
		$this->sendJSON($message,$status);
	}
}
