
Begin
create table public.predio(
	id integer primary key,
	avaluo integer not null,
	departamento text not null,
	municipio text not null
);

create type public.construccion_tipo as enum (
	'industrial',
	'comercial',
	'residencial'
);

create table public.construccion (
	id integer primary key,
	pisos integer not null,
	areac integer not null,
	tipo public.construccion_tipo ,
	dir text not null,
	predio_id integer not null references public.predio(id)
);


create type public.terreno_regimen as enum (
	'urbano',
	'rural'
);


create table public.terreno (
	id integer primary key,
	areac integer not null,
	valor integer not null,
	aguacerca boolean not null,
	regimen public.terreno_regimen not null,
	construido boolean not null,
	predio_id integer not null references public.predio(id) 
	
);

create type public.propietario_tipo as enum (
	'natural',
	'juridica'
);

create table public.propietario (
	id integer primary key,
	tipo  public.propietario_tipo not null,
	numdoc integer,
	nombre text,
	apellido text,
	nit integer,
	razonsoc text,
	direccion text not null,
	telefono integer not null,
	correo text

);

create table predio_propietario(
	propietario_id integer  references public.propietario(id),
	predio_id integer  references public.predio(id),
	primary key(propietario_id,predio_id)
)

alter table predio  add column nombre text not null;

end;