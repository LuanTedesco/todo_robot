// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from './application'

import ModalController from './modal_controller'
application.register('modal', ModalController)

import TaskModalController from './generic_modal_controller'
application.register('generic-modal', TaskModalController)
