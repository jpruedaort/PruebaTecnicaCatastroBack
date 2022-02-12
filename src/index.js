const express = require("express");
const { postgraphile } = require("postgraphile");
const PgManyToManyPlugin = require("@graphile-contrib/pg-many-to-many");
const app = express();

app.set("port", process.env.PORT || 3000);

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.use(
  postgraphile(
    process.env.DATABASE_URL ||
      "postgres://postgres:password@localhost/catastrodb",
    "public",
    {
      appendPlugins: [PgManyToManyPlugin],
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true,
    }
  )
);

app.listen(app.get("port"), () => {
  console.log("Servidor en puerto ", app.get("port"));
});
