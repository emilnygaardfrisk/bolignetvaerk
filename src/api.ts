import { URL } from "url";

export function route(endpoint: string): string {
  switch (endpoint) {
    case "test":
      return '{"value": "testing api!"}';
		default:
			return 'error';
  }
}
