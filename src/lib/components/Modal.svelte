<script lang='ts'>
    import { Modal } from 'flowbite-svelte';

    export let isShow: bool = false;
    let defaultConfig: any = {
        title: 'Modal Title',
        dismissable: true,
        url: null
    };

    export let config: any = {};
    config = Object.assign(defaultConfig, config);
</script>

<Modal title='{config.title}' bind:open={isShow} placement='center' dismissable={config.dismissable}
       outsideclose={config.dismissable}>

    {#if config.url !== null }
        <iframe title='IFrame Title' src='{config.url}' style='width:100vh; height:80vh;'></iframe>
    {:else}
        <slot />
    {/if}
</Modal>