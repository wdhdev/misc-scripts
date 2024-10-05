(async () => {
    const data = await fetch("https://raw-api.is-a.dev").then(res => res.json());

    const owners = [];

    data.forEach(s => {
        if(s.subdomain.length === 1 && s.subdomain !== "@") {
            owners[s.owner.username] = owners[s.owner.username] ? owners[s.owner.username] + 1 : 1;
            console.log(`${s.domain} - ${s.owner.username}`)
        }
    })

    console.log(owners);
})()
