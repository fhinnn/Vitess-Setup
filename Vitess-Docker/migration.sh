docker exec -w /vt/vtdataroot/vt_0000000101 vitess sh -c "sed -i 's/max_connections = 500/max_connections = 100000/' my.cnf"

docker exec vitess sh -c "mysqlctl --tablet_uid 101 --alsologtostderr shutdown && mysqlctl --tablet_uid 101 --alsologtostderr start"

docker cp schema_init.json vitess:/vt/src/vitess.io/vitess/examples/local/vschema_commerce_initial.json 
docker exec -w /vt/src/vitess.io/vitess/examples/local vitess sh -c "vtctldclient --server localhost:15999 ApplyVSchema --vschema-file vschema_commerce_initial.json commerce"

docker exec -w /vt/src/vitess.io/vitess/examples/common/scripts vitess sh -c "bash vtadmin-down.sh && bash vtadmin-up.sh"