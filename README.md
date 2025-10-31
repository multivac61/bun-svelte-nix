nix build fails with following error

```console
> nix build .#packages.x86_64-linux.default -Lvv 
....
my-app> Running phase: unpackPhase
my-app> unpacking source archive /nix/store/fcji21av3m9xzj0g337ccllik94m689q-8aa6w4qvxyi2iyzkasc613a5rvsvp46q-source
my-app> source root is 8aa6w4qvxyi2iyzkasc613a5rvsvp46q-source
my-app> Running phase: patchPhase
my-app> patching script interpreter paths in .
my-app> Running phase: bunSetInstallCacheDir
my-app> Running phase: updateAutotoolsGnuConfigScriptsPhase
my-app> Running phase: configurePhase
my-app> no configure script, doing nothing
my-app> Running phase: bunNodeModulesInstallPhase
my-app> bun install v1.3.1 (89fa0f34)
my-app>   🔍 Resolving [1/8]   🔍 @sveltejs/vite-plugin-svelte [49/48] error: ConnectionRefused downloading package manifest svelte-adapter-bun
my-app>
my-app> error: ConnectionRefused downloading package manifest @sveltejs/adapter-auto
my-app>
my-app> error: ConnectionRefused downloading package manifest svelte
my-app>
my-app> error: ConnectionRefused downloading package manifest typescript
my-app>
my-app> error: ConnectionRefused downloading package manifest svelte-check
my-app>
my-app> error: ConnectionRefused downloading package manifest @sveltejs/vite-plugin-svelte
my-app>
my-app> error: ConnectionRefused downloading package manifest @sveltejs/kit
my-app>
my-app> error: ConnectionRefused downloading package manifest vite
my-app> error: @sveltejs/adapter-auto@^7.0.0 failed to resolve
my-app> error: @sveltejs/kit@^2.48.2 failed to resolve
my-app> error: @sveltejs/vite-plugin-svelte@^6.2.1 failed to resolve
my-app> error: svelte@^5.42.3 failed to resolve
my-app> error: svelte-adapter-bun@^1.0.1 failed to resolve
my-app> error: svelte-check@^4.3.3 failed to resolve
my-app> error: typescript@^5.9.3 failed to resolve
my-app> error: vite@^7.1.12 failed to resolve
error: build of '/nix/store/iinz1j82cg1z7klbiaal3n9g6hgsa7mb-my-app-0.0.1.drv' failed: Cannot build '/nix/store/iinz1j82cg1z7klbiaal3n9g6hgsa7mb-my-app-0.0.1.drv'.
       Reason: builder failed with exit code 1.
       Output paths:
         /nix/store/2dvgibh9a5w82nxsys53985h1fnv3jcb-my-app-0.0.1
       Last 25 log lines:
       > Running phase: bunNodeModulesInstallPhase
       > bun install v1.3.1 (89fa0f34)
       >   🔍 Resolving [1/8]   🔍 @sveltejs/vite-plugin-svelte [49/48] error: ConnectionRefused downloading package manifest svelte-adapter-bun
       >
       > error: ConnectionRefused downloading package manifest @sveltejs/adapter-auto
       >
       > error: ConnectionRefused downloading package manifest svelte
       >
       > error: ConnectionRefused downloading package manifest typescript
       >
       > error: ConnectionRefused downloading package manifest svelte-check
       >
       > error: ConnectionRefused downloading package manifest @sveltejs/vite-plugin-svelte
       >
       > error: ConnectionRefused downloading package manifest @sveltejs/kit
       >
       > error: ConnectionRefused downloading package manifest vite
       > error: @sveltejs/adapter-auto@^7.0.0 failed to resolve
       > error: @sveltejs/kit@^2.48.2 failed to resolve
       > error: @sveltejs/vite-plugin-svelte@^6.2.1 failed to resolve
       > error: svelte@^5.42.3 failed to resolve
       > error: svelte-adapter-bun@^1.0.1 failed to resolve
       > error: svelte-check@^4.3.3 failed to resolve
       > error: typescript@^5.9.3 failed to resolve
       > error: vite@^7.1.12 failed to resolve
       For full logs, run:
         nix log /nix/store/iinz1j82cg1z7klbiaal3n9g6hgsa7mb-my-app-0.0.1.drv
error: Cannot build '/nix/store/iinz1j82cg1z7klbiaal3n9g6hgsa7mb-my-app-0.0.1.drv'.
       Reason: builder failed with exit code 1.
       Output paths:
         /nix/store/2dvgibh9a5w82nxsys53985h1fnv3jcb-my-app-0.0.1
```
