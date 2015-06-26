<index-view>
	<div class="index">#index</div>

	<common></common>

	<style>
		.index {
			color: red;
		}
	</style>

	<script>
		require('../commons/common.tag');

		this.on('mount', function(){
			riot.mount('common');
		});
	</script>
</index-view>