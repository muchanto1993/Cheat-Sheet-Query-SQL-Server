begin tran
print 'Create Table - Begin'
create table #tablea (
	id		varchar(5)
	,name	varchar(10)
)

create table #tableb (
	name varchar(10)
)

create table #tablec (
	createdate	datetime
	,id			varchar(5)
	,name		varchar(10)
)
print 'Create Table - End'

print 'Insert Table - Begin'
insert into #tablea
select	'1',  'Anto1'	union all	
select	'2',  'Anto'	union all --masuk ke table c
select	'3',  'Anto5'	union all
select	'4',  'Anto9'	union all --masuk ke table c
select	'5',  'Anto3'	union all
select	'6',  'Anto2'	union all
select	'7', 'Anto10'	union all --masuk ke table c
select	'8',  'Anto7'	union all --masuk ke table c
select	'9',  'Anto8'	union all --masuk ke table c
select '10', 'Anto99'	union all --masuk ke table c
select '11',  'Anto5'	union all
select '12',  'Anto4'	union all
select '13',  'Anto3'	union all
select '14',  'Anto2'	union all
select '15',  'Anto1'


insert into #tableb
select 'Anto1' union all
select 'Anto2' union all
select 'Anto3' union all
select 'Anto4' union all
select 'Anto5'

print 'Insert Table - End'

print 'Process Date - Begin'
insert into #tablec 
	  (createdate, id, name)
select getdate(), a.id, a.name from #tablea a where not exists (select top 1 1 from #tableb b where b.name = a.name)

select * from #tablec
print 'Process Date - End'

drop table #tablea
drop table #tableb
drop table #tablec
rollback tran
