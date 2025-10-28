nix build fails with following error

```console
> nix build .# -Lvvv 
error: build of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' on 'ssh-ng://nix-ssh@gkr' failed: Cannot build '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv'.
       Reason: builder failed with exit code 2.
       Output paths:
         /nix/store/h8s7cgkwscm1fs2shw1qcgp9j22bx4y8-sveltekit-bun2nix-example-0.0.1
       Last 16 log lines:
       > Running phase: unpackPhase
       > unpacking source archive /nix/store/akr8hv7prq0hqfaiplsp83b6r5in0xbz-7vrc89lam581n7kai23i4m9cwx9qs3ja-source
       > source root is 7vrc89lam581n7kai23i4m9cwx9qs3ja-source
       > Running phase: patchPhase
       > Running phase: preNodeModulesInstallFixupPhase
       > patching script interpreter paths in .
       > Running phase: installNodeModulesPhase
       > Running phase: updateAutotoolsGnuConfigScriptsPhase
       > Running phase: configurePhase
       > no configure script, doing nothing
       > Running phase: buildPhase
       > $ vite build
       > /nix/var/nix/builds/nix-75049-2218122540/7vrc89lam581n7kai23i4m9cwx9qs3ja-source/node_modules/.bin/vite: line 2: import: command not found
       > /nix/var/nix/builds/nix-75049-2218122540/7vrc89lam581n7kai23i4m9cwx9qs3ja-source/node_modules/.bin/vite: line 3: import: command not found
       > /nix/var/nix/builds/nix-75049-2218122540/7vrc89lam581n7kai23i4m9cwx9qs3ja-source/node_modules/.bin/vite: line 5: syntax error near unexpected token `'node_modules''
       > /nix/var/nix/builds/nix-75049-2218122540/7vrc89lam581n7kai23i4m9cwx9qs3ja-source/node_modules/.bin/vite: line 5: `if (!import.meta.url.includes('node_modules')) {'
       For full logs, run:
         nix log /nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: got EOF
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: woken up
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: hook build done
killing process 90047
build hook for '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' finished
lock released on '/nix/store/h8s7cgkwscm1fs2shw1qcgp9j22bx4y8-sveltekit-bun2nix-example-0.0.1.lock'
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: done
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: waitee 'building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation' done; 0 left
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: woken up
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: in final_awaiter
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: in final_awaiter
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: outer build done
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: done
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': waitee 'building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation' done; 0 left
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': woken up
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' from in-memory derivation: goal destroyed
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: in final_awaiter
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': in final_awaiter
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': outer build done
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': done
building of '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv^out' from in-memory derivation: goal destroyed
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': in final_awaiter
outer obtaining drv from '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv' and then building outputs 'out': goal destroyed
error: Cannot build '/nix/store/ckgjb257mqh0pasg7vrxwxwd4g9v34pw-sveltekit-bun2nix-example-0.0.1.drv'.
       Reason: builder failed with exit code 1.
       Output paths:
         /nix/store/h8s7cgkwscm1fs2shw1qcgp9j22bx4y8-sveltekit-bun2nix-example-0.0.1
```
