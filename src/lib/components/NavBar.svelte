<script lang='ts'>
    import { page } from '$app/stores';
    import {
        Navbar,
        NavBrand,
        NavLi,
        NavUl,
        NavHamburger,
        Dropdown,
        DropdownHeader,
        DropdownItem,
        DropdownDivider,
        Avatar, DarkMode
    } from 'flowbite-svelte';

    let defaultConfig: any = {
        app: {
            name: 'Vita',
            logo: 'https://flowbite-svelte.com/images/flowbite-svelte-icon-logo.svg'
        },
        menus: [{
            'title': 'Home',
            'url': '/'
        }, {
            'title': 'Ares',
            'url': '/ares'
        }, {
            'title': 'Athena',
            'url': '/athena'
        }, {
            'title': 'Chronos',
            'url': '/chronos'
        }, {
            'title': 'Hades',
            'url': '/hades'
        }, {
            'title': 'Hermes',
            'url': '/hermes'
        }],
        user: {
            name: 'Kavindu Athaudha',
            email: 'kavindu@kih.com.sg',
            avatar: 'https://flowbite-svelte.com/images/profile-picture-3.webp'
        }
    };

    export let config: any = {};
    config = Object.assign(defaultConfig, config);

    $: activeUrl = $page.url.pathname;
</script>

<Navbar let:NavContainer color='primary'>
    <NavContainer class='border px-5 py-2 rounded-xl bg-white dark:bg-gray-600'>
        <NavBrand href='/'>
            <img src='{config.app.logo}' class='mr-3 h-6 sm:h-9'
                 alt='{config.app.name} Logo' />
            <span class='self-center whitespace-nowrap text-xl font-semibold dark:text-white'>{config.app.name}</span>
        </NavBrand>
        <div class='flex items-center md:order-2'>
            <DarkMode />
            &nbsp;
            <Avatar id='avatar-menu' src='{config.user.avatar}' />
            <NavHamburger class1='w-full md:flex md:w-auto md:order-1' />
        </div>
        <NavUl {activeUrl}>
            {#each config.menus as menu}
                <NavLi href='{menu.url}'>{menu.title}</NavLi>
            {/each}
        </NavUl>

        <Dropdown placement='bottom' triggeredBy='#avatar-menu'>
            <DropdownHeader>
                <span class='block text-sm'>{config.user.name}</span>
                <span class='block truncate text-sm font-medium'>{config.user.email}</span>
            </DropdownHeader>
            <!--<DropdownItem>Dashboard</DropdownItem>-->
            <!--<DropdownItem>Settings</DropdownItem>-->
            <!--<DropdownItem>Earnings</DropdownItem>-->
            <!--<DropdownDivider />-->
            <!--<DropdownItem>-->
            <!--</DropdownItem>-->
            <DropdownItem>Sign out</DropdownItem>
        </Dropdown>

    </NavContainer>
</Navbar>