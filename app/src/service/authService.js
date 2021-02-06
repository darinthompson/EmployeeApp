import services from './services';

export default {
    register (user) {
        return services().post('user/create', user)
    }
}