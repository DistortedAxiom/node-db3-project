const knex = require('knex');
const knexConfig = require('../knexfile.js');
const db = knex(knexConfig.development);

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
            .where({id})
            .first()
}

function findSteps(id) {

    /*

    select `schemes`.`scheme_name`, `steps`.`step_number`, `steps`.`instructions`
    from `schemes`
    inner join `steps` on `schemes`.`id` = `steps`.`scheme_id`
    where `scheme_id` = '3'
    order by `steps`.`step_number` asc

    */

    return db('schemes')
        .where("scheme_id", id)
        .select("schemes.scheme_name", "steps.step_number", "steps.instructions")
        .join("steps", "schemes.id", "steps.scheme_id")
        .orderBy("steps.step_number")
}

function add(scheme) {
    return db('schemes')
        .insert(scheme, "id")
        .then(ids => {
            return findById(ids)
        })
}

function update(changes, id) {
    return db('schemes')
        .where({id})
        .update(changes)
        .then(() => {
            return findById(id)
        })
}

function remove(id) {
    let toBeDeleted = findById(id).then((item) => {
        return item
    })

    return db("schemes")
        .where({id})
        .del()
        .then(() => {
            return toBeDeleted
        })
}
