'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('user2s', [{
      firstName_user2: 'John',
      lastName_user2 : 'Doe',
      email_user_2: 'example@example.com',
      createdAt: new Date(),
      updatedAt: new Date()
    }]);
 
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.bulkDelete('Users', null, {});
  }
};
