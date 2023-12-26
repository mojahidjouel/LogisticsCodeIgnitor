<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Price extends My_Controller {
	protected $table="price";
	public function __construct(){
		Parent::__construct();
		$this->load->model('Common_model','cm');
	}
	
	public function index(){
		$data=$this->db->query("SELECT price.*,(SELECT name from city WHERE city.id=price.to_city) as to_city_name,(SELECT name from city WHERE city.id=price.from_city) as from_city_name FROM `price`")->result_array();
		$status=0;
		if($data)
			$status=1;

		$this->sendJSON($data,$status);
	}
	public function get_price($from_city,$to,$product_weight){

		$data=$this->db->query("select * from price where from_city=".$from_city." and to_city=".$to." ")->result_array();
		$status=0;
		$pricedata=array();
		if($data){
			foreach($data as $d){
				$weight=explode('-',$d['unit_size']);
				if($weight[0] <= $product_weight and $weight[1] >= $product_weight){
					$unitprice= $product_weight * $d['unit_price'];
					$base_price= $d['base_price'];
					$total= $d['base_price'] + $unitprice;
					$pricedata=array("unitprice"=>$unitprice,"base_price"=>$base_price,"shipping_cost"=>$total);
					$status=1;
				}
			}
		}
			

		$this->sendJSON($pricedata,$status);
	}

	public function create(){
		$data = json_decode(file_get_contents("php://input"),true);
		
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
