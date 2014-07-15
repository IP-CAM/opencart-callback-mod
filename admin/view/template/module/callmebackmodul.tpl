<?php echo $header; ?>
<div id="content" class="callmeback">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div>
        <div class="callmeback-tabs-mini">
          <ul>
            <li class="mini-tab basic" data-tab-to-open="basic">Basic</li>
            <li class="mini-tab pro" data-tab-to-open="pro">PRO</li>
          </ul>
        </div>
        <div class="callmeback-tabs">
          <ul>
            <li class="tab-data basic">

              <ul id="fields"></ul>
              <div id="fields-previews"></div>
              <div class="add-buttons">
                <a href="#" class="add-new-field"><span><?php echo $add_new_field; ?></span></a>
                <a href="#" class="add-confirm"><span>Подтвердить</span></a>

                <div class="option-popup">
                  <div class="popup-box type-box">
                    <h6 class="title">Выберите тип поля</h6>
                    <label for="field-text"><input type="radio" id="field-text" value="text" name="field_type"><?php echo $add_field_text; ?></label>
                    <label for="field-textarea"><input type="radio" id="field-textarea" value="textarea" name="field_type"><?php echo $add_field_textarea; ?></label>
                    <!-- <label for="field-checkbox"><input type="radio" id="field-checkbox" value="checkbox" name="field_type"><?php echo $add_field_checkbox; ?></label>
                    <label for="field-radio"><input type="radio" id="field-radio" value="radio" name="field_type"><?php echo $add_field_radio; ?></label> -->
                  </div>
                  <div class="popup-box param-box param-text">
                    <h6 class="title">Выберите параметры поля</h6>
                    <table>
                      <tr>
                        <td><label for="add-field-name">Название <span class="required">*</span></label></td>
                        <td><input type="text" name="add_name" value="" placeholder="" id="add-field-name"></td>
                      </tr>
                      <tr>
                        <td><label for="add-field-placeholder">Плейсхолдер</label></td>
                        <td><input type="text" name="add_placeholder" value="" placeholder="" id="add-field-placeholder"></td>
                      </tr>
                      <tr>
                        <td><label for="add-field-sort">Сортировка</label></td>
                        <td><input type="text" name="add_default_value" value="" placeholder="" id="add-field-sort"></td>
                      </tr>
                      <tr>
                        <td><label for="add-field-default-value">Значение по умолчанию</label></td>
                        <td><input type="text" name="add_default_value" value="" placeholder="" id="add-field-default-value"></td>
                      </tr>
                    </table>
                  </div>
                  <div class="popup-box param-box param-button">
                    <h6 class="title">Выберите параметры поля</h6>
                    <table>
                      <tr>
                        <td><label for="add-box-name">Название</label></td>
                        <td><input type="text" name="param_button" value="" placeholder="" id="add-box-name"></td>
                      </tr>
                      <tr>
                        <td><label for="add-box-sort">Сортировка</label></td>
                        <td><input type="text" name="param_button" value="" placeholder="" id="add-box-sort"></td>
                      </tr>
                      <tr>
                        <td><label>Значение по умолчанию</label></td>
                        <td><label for="add-box-default-value"><input type="checkbox" name="param_button" value="checked" placeholder="" id="add-box-default-value">checked</label></td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </li>
            <li class="tab-data pro">...empty...</li>
          </ul>
        </div>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="callmebackmodul_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="callmebackmodul_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="callmebackmodul_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="callmebackmodul_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="callmebackmodul_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="callmebackmodul_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="callmebackmodul_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="callmebackmodul_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	module_row++;
}
//--></script> 
<?php echo $footer; ?>