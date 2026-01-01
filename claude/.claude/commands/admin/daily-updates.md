- run `daily-commits` and give me a summary by repository
- format your response like how i write my daily updates.
-

<FORMAT>
done:

repository_name:

- ...

dojo-messaging:

- fix pypi version lagging behind - removed auto-publish on main branch push
- update logging - changed error levels to trace, added URL context to server errors

dojo:

- fix redis-om indexing issues - switched between HashModel/JsonModel with proper index=True
- cleanup unused imports in validator - removed bittensor subtensor/wallet references
- update miner documentation - added Redis host/port configuration examples
- fix dependency versions - bumped dojo-messaging to 1.0.10, fixed bittensor-drand tag to v0.5.0
- reorganize environment variables - moved Redis config to shared section

dojo-synthetic-api:

- migrate to nuitka compilation - pinned version 2.7.6 for stability
- update docker build process for compiled binaries

repository_name:

- ...

</FORMAT>
