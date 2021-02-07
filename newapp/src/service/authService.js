import services from './services';

export default {
    register (user) {
        return services().post('user/create', user)
    },
    logIn (credentials) {
        console.log(credentials);
        return services().post("user/login", credentials);
    }
}