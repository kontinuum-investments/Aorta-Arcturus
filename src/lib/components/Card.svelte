<script lang='ts'>
    import { Card, Spinner } from 'flowbite-svelte';

    export let title: string = 'Card Title';
    export let isLoaded: boolean = true;
    let defaultConfig: any = {
//        height: '96', width: '96'
    };

    export let config: any = {};
    config = Object.assign(defaultConfig, config);
</script>

<Card class='w-{config.width} h-{config.height}'>
    <h5 class='title mb-2 text-3xl font-bold text-gray-900 dark:text-white'>{title}</h5>
    <hr style='padding-bottom: 1rem' />

    <div class='centerh'>
        {#if isLoaded}
            <slot />
        {:else}
            <div class='centerv'>
                <Spinner />
            </div>
        {/if}
    </div>
</Card>