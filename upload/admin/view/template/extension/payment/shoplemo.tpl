<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-free-checkout" data-toggle="tooltip" title="<?php echo $shoplemoLang->saveButton; ?>" class="btn btn-primary">
					<i class="fa fa-save"></i>
				</button>
				<a href="<?php echo $formCancelUrl; ?>" data-toggle="tooltip" title="<?php echo $shoplemoLang->cancelButton; ?>" class="btn btn-default">
					<i class="fa fa-reply"></i>
				</a>
			</div>
			<h1><?php echo $shoplemoLang->title; ?></h1>
			<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
				</li>
			<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">

		<?php if (count($errors) > 0) { ?>
			<div class="alert alert-danger">
				<?php foreach ($errors as $index => $error) { ?>
					<p>
						<i class="fa fa-exclamation-circle"></i>
						<?php echo $shoplemoLang->error_messages[$index]; ?>
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</p>
				<?php } ?>
			</div>
		<?php } ?>

		<form action="<?php echo $formActionUrl; ?>" method="post" enctype="multipart/form-data" id="form-free-checkout" class="form-horizontal">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-pencil"></i>
						<?php echo $shoplemoLang->integrationSettingsTitle; ?>
						<?php echo $shoplemoLang->integrationSettingsTitleDesc; ?>
					</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->integrationKey; ?></label>
						<div class="col-sm-10">
							<input type="text" name="shoplemo_api_key" value="<?php echo $shoplemo_api_key; ?>" class="form-control"/>

							<?php if (array_key_exists('required_field_api_key', $errors) || !isset($shoplemo_api_key) || !isset($shoplemo_api_key)) { ?>
								<span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_api_key']; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->integrationSecret ; ?></label>
						<div class="col-sm-10">

							<input type="text" name="shoplemo_secret_key" value="<?php echo $shoplemo_secret_key; ?>" class="form-control"/>
							<?php if (array_key_exists('required_field_api_secret', $errors) || !isset($shoplemo_secret_key) || !isset($shoplemo_secret_key)) { ?>
								<span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_api_secret']; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->integrationCallbackUrl; ?></label>
						<div class="col-sm-10">

							<div class="alert alert-info">
								<i class="fa fa-exclamation-circle"></i> <?php echo $callback_url; ?>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-pencil"></i>
						<?php echo $shoplemoLang->orderSettingsTitle; ?></h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->onPaymentApproved; ?></label>
						<div class="col-sm-10">
							<select name="shoplemo_order_completed_id" class="form-control">
								<?php if (!isset($shoplemo_order_completed_id)) { ?>
									<option value='' selected><?php echo $shoplemoLang->onPaymentCallbackSelect; ?></option>
								<?php
								}
								foreach ($order_statuses as $order_status)
								{
								?>
									<option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $shoplemo_order_completed_id) { ?>selected="selected" <?php } ?>><?php echo $order_status['name']; ?></option>
								<?php } ?>
							</select>
							<span class="help"><?php echo $shoplemoLang->onPaymentApprovedDesc; ?></span><br />

							<?php if (array_key_exists('required_field_onPaymentApproved', $errors) || !isset($shoplemo_order_completed_id) || !isset($shoplemo_order_completed_id)) { ?>
								<span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_onPaymentApproved']; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->onPaymentCanceled; ?></label>
						<div class="col-sm-10">
							<select name="shoplemo_order_canceled_id" class="form-control">
								<?php if (!isset($shoplemo_order_canceled_id)) { ?>
									<option value='0' selected><?php echo $shoplemoLang->onPaymentCallbackSelect; ?></option>
								<?php
								}
								foreach ($order_statuses as $order_status)
								{
								?>
									<option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $shoplemo_order_canceled_id) { ?>selected="selected" <?php } ?>><?php echo $order_status['name']; ?></option>
								<?php } ?>
							</select>
							<span class="help"><?php echo $shoplemoLang->onPaymentCanceledDesc; ?></span><br />

							<?php if (array_key_exists('required_field_onPaymentCanceled', $errors) || !isset($shoplemo_order_canceled_id) || !isset($shoplemo_order_canceled_id)) { ?>
								<span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_onPaymentCanceled']; ?></span>
							<?php } ?>
						</div>
					</div>


				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-pencil"></i>
						<?php echo $shoplemoLang->otherSettingsTitle; ?></h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->extensionStatus; ?></label>
						<div class="col-sm-10">
							<select name="shoplemo_status" class="form-control">
								<option value="1" <?php if ($shoplemo_status == 1) { ?> selected="selected" <?php } ?>><?php echo $shoplemoLang->extensionActive; ?></option>
								<option value="0" <?php if ($shoplemo_status == 0) { ?> selected="selected" <?php } ?>><?php echo $shoplemoLang->extensionInactive; ?></option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->extensionLang; ?></label>
						<div class="col-sm-10">
							<select name="shoplemo_lang" class="form-control">
							<?php
							foreach ($availableLanguages as $key => $val)
							{
							?>
								<option value="<?php echo $key; ?>" <?php if ($shoplemo_lang == $key) { ?> selected="selected" <?php } ?>><?php echo $val; ?></option>
							<?php } ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->minimumCartTotal; ?></label>
						<div class="col-sm-10">
							<input name="shoplemo_minimum_cart_total" value="<?php echo $shoplemo_minimum_cart_total; ?>" class="form-control">

							<?php if (array_key_exists('required_field_minimum_cart_total', $errors) || !isset($shoplemo_minimum_cart_total) || !isset($shoplemo_minimum_cart_total)) { ?>
								<span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_minimum_cart_total']; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->paymentOptionSortOrder; ?></label>
						<div class="col-sm-10">
							<input name="shoplemo_sort_order" value="<?php echo $shoplemo_sort_order; ?>" class="form-control">
							<span class="help"><?php echo $shoplemoLang->paymentOptionSortOrderDesc; ?></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $shoplemoLang->paymentGeoZoneId; ?></label>
						<div class="col-sm-10">
							<select name="shoplemo_geo_zone_id" id="input-order-status-completed" class="form-control">
								<option value='' selected><?php echo $shoplemoLang->paymentGeoZoneNull; ?></option>
								<?php
								foreach ($geo_zones as $geo_zone)
								{
								?>
									<option value="<?php echo $geo_zone['geo_zone_id']; ?>" <?php if ($geo_zone['geo_zone_id'] == $shoplemo_geo_zone_id) { ?> selected="selected" <?php } ?>><?php echo $geo_zone['name']; ?></option>
								<?php } ?>
							</select>
							<span class="help"><?php echo $shoplemoLang->paymentGeoZoneIdDesc; ?></span>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div></div></div></div><?php echo $footer; ?>
