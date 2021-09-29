import 'package:flutter/material.dart';

class RequestWrapper<T> {
  String message;
  T data;
  States states;

  RequestWrapper.loading() : this.states = States.loading;

  RequestWrapper.success(this.data) : this.states = States.success;

  RequestWrapper.list(this.data) : this.states = States.list;

  RequestWrapper.error(this.message) : this.states = States.error;

  RequestWrapper.idle() : this.states = States.idle;

  Widget res(
      {Widget Function(T data) completed,
      Widget loading = const Center(
        child: const CircularProgressIndicator(),
      ),
      Widget idle = const SizedBox(),
      @required Widget Function(String error) error}) {
    switch (states) {
      case States.loading:
        return loading;
      case States.success:
      case States.list:
        return completed(data);
      case States.error:
        return error(message);
      default:
        return idle;
    }
  }

  List<Widget> listRes(
      {List<Widget> Function(T list) list,
      List<Widget> loading = const [
        const Center(
          child: const CircularProgressIndicator(),
        ),
      ],
      List<Widget> idle = const [const SizedBox()],
      @required List<Widget> Function(String message) error}) {
    switch (states) {
      case States.loading:
        return loading;
      case States.list:
        return list(data);
      case States.error:
        return error(message);
      default:
        return idle;
    }
  }
}

enum States { loading, success, error, idle, list }
