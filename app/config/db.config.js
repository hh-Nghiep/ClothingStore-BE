const config = {
    user: 'sqlserver',
    password: '123',
    server: '35.238.254.158',
    database: 'DB_ClothingWebsite',
    options: {
        encrypt: false,
        trustedconnection: true,
        enableArithAbort: true,
        instancename: 'SQLEXPRESS'
    },
    port: 1433
}

module.exports = config;