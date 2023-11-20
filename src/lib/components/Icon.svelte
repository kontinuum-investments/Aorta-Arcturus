<script lang='ts'>
    export let icon: string = 'home';
    let defaultConfig: any = { fill: '0', weight: '700', grade: '200', opticalSize: '48' };
    export let config: any = {};
    config = Object.assign(defaultConfig, config);
</script>

<span class='material-symbols-sharp'>
{icon}
</span>

<link rel='stylesheet'
      href='https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@{config.opticalSize},{config.weight},{config.fill},{config.grade}' />