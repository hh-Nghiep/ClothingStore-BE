
const config = {
    user: 'sa',
    password: '123',
    server: '127.0.0.1',
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