<script lang='ts'>
    import {
        Table,
        TableBody,
        TableBodyCell,
        TableBodyRow,
        TableHead,
        TableHeadCell
    } from 'flowbite-svelte';
    import { writable } from 'svelte/store';

    export let defaultConfig: any = { title: null, caption: null };
    export let config: any = {};
    config = Object.assign(defaultConfig, config);

    //    Sorting Data
    export let data: any[] = [
        { id: 1, maker: 'Toyota', type: 'ABC', make: 2017 },
        { id: 2, maker: 'Ford', type: 'CDE', make: 2018 },
        { id: 3, maker: 'Volvo', type: 'FGH', make: 2019 },
        { id: 4, maker: 'Saab', type: 'IJK', make: 2020 }
    ];
    $:headers = Object.keys(data[0]);
    const sortKey: string = writable('id');
    const sortDirection: number = writable(1);
    const sortItems: any[] = writable(data.slice());

    const sortTable = (key) => {
        if ($sortKey === key) {
            sortDirection.update((val) => -val);
        } else {
            sortKey.set(key);
            sortDirection.set(1);
        }
    };

    $: {
        const key: string = $sortKey;
        const direction: number = $sortDirection;
        const sorted: any[] = [...$sortItems].sort((a, b) => {
            const aVal: string = a[key];
            const bVal: string = b[key];
            if (aVal < bVal) {
                return -direction;
            } else if (aVal > bVal) {
                return direction;
            }
            return 0;
        });
        sortItems.set(sorted);
    }
</script>

<Table hoverable={true}>
    {#if config.title !== null}
        <caption
            class='p-5 text-lg font-semibold text-left text-gray-900 bg-white dark:text-white dark:bg-gray-800'>
            {config.title}

            {#if config.caption !== null}
                <p class='mt-1 text-sm font-normal text-gray-500 dark:text-gray-400'>{config.caption}</p>
            {/if}
        </caption>
    {/if}
    <TableHead>
        {#each headers as header}
            <TableHeadCell on:click={() => sortTable(header)}>{header}</TableHeadCell>
        {/each}
    </TableHead>
    <TableBody>
        {#each data as item}
            <TableBodyRow>
                {#each Object.keys(item) as key}
                    <TableBodyCell>{item[key]}</TableBodyCell>
                {/each}
            </TableBodyRow>
        {/each}
    </TableBody>
</Table>
