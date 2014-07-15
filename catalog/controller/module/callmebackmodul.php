<?php  
class ControllerModulecallmebackmodul extends Controller {
	protected function index() {

		$this->load->language('module/callmebackmodul');/// TO DO - language not loading

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/test.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/callmebackmodul.tpl';
		} else {
			$this->template = 'default/template/module/callmebackmodul.tpl';
		}		
		// print_r($this->language);die();
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->render();
	}
}
?>