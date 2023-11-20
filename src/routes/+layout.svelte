<script>
    import '../app.pcss';
    import '$lib/app.css';
    import { NavBar } from '$lib/index.ts';

</script>

<div class='header'>
    <NavBar />
</div>

<div class='centerh'>
    <slot></slot>
</div>