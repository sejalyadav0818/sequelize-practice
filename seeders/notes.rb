Refrance : https://github.com/sequelize/cli
https://sequelize.org/api/v6/class/src/dialects/abstract/query-interface.js~queryinterface

npm install --save-dev sequelize-cli 
npm install --save sequelize
npx sequelize-cli init 

create models : npx sequelize-cli model:generate --name User --attributes firstName:string,lastName:string,email:string

for migration npx sequelize-cli db:migrate 
after migration db 2 table will craete 
1.user : tanle 
2.SequelizeMeta : name of migration 

for undo last updated one  : npx sequelize-cli db:migrate:undo
for undo all  : npx sequelize-cli db:migrate:undo:all
to remove particuler : npx sequelize-cli db:migrate:undo --name 20230418111008-create-user-1.js
for status : npx sequelize-cli db:migrate:status
status (delete - down  , insert - up )

make Seeds : to craete file 
for add data : npx sequelize-cli seed:generate --name demo-user 
npx sequelize-cli db:seed:all //insert in both table
chnage in seeders file 
'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('Users', [{
      firstName: 'John',
      lastName: 'Doe',
      email: 'example@example.com',
      createdAt: new Date(),
      updatedAt: new Date()
    }]);
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.bulkDelete('Users', null, {});
  }
};

add seeds for particuler: npx sequelize-cli db:seed: --seed 20230418120353-demo-user.js


undo last seeds : npx sequelize-cli db:seed:undo
undo all  seeds : npx sequelize-cli db:seed:undo:all
for particuler : npx sequelize-cli db:seed:undo --seed 20230418111008-create-user-1.js


create migration-skeleton  : npx sequelize-cli migration:generate --name migration-skeleton
crarte table : 
code
  up: (queryInterface, Sequelize) => {  // add 
    return queryInterface.createTable('Person', {
      name: Sequelize.DataTypes.STRING,
      isBetaMember: {
        type: Sequelize.DataTypes.BOOLEAN,
        defaultValue: false,
        allowNull: false
      }
    });
  },
  down: (queryInterface, Sequelize) => {// undo
    return queryInterface.dropTable('Person');
  }
};

Output : 
to save  npx sequelize-cli db:migrate
Table craeated Person

Columns:
	name	varchar(255)
	isBetaMember	tinyint(1)

to add & remove coulmn : 

create new migration first 
create migration-skeleton  : npx sequelize-cli migration:generate --name migration-skeleton
module.exports = {
  up: (queryInterface, Sequelize) => {// add 
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.addColumn('Person', 'petName', {
          type: Sequelize.DataTypes.STRING
        }, { transaction: t }),
        queryInterface.addColumn('Person', 'favoriteColor', {
          type: Sequelize.DataTypes.STRING,
        }, { transaction: t })
      ]);
    });
  },
  down: (queryInterface, Sequelize) => { //undo
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.removeColumn('Person', 'petName', { transaction: t }),
        queryInterface.removeColumn('Person', 'favoriteColor', { transaction: t })
      ]);
    });
  }
};

to save  npx sequelize-cli db:migrate
output : 
coulum added 


/////////////

add foreign key 
1.craete new migration 
npx sequelize-cli migration:generate --name migration-skeleton

2.add into migration file
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Person', {
      name: Sequelize.DataTypes.STRING,
      isBetaMember: {
        type: Sequelize.DataTypes.BOOLEAN,
        defaultValue: false,
        allowNull: false
      },
      userId: {
        type: Sequelize.DataTypes.INTEGER,
        references: {
          model: {
            tableName: 'Users',
            schema: 'Student'
          },
          key: 'id'
        },
        allowNull: false
      },
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Person');
  }
}

3.to save npx sequelize-cli db:migrate
4.

..............


//sync/await  
