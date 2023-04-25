<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Users</h6>
        <div class="dropdown no-arrow">
            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                <div class="dropdown-header">Options:</div>
                <a class="dropdown-item" href="http://localhost/php_ecomm/admin/user/create.php"><i class="fas fa-plus"></i> Add</a>
                <a class="dropdown-item" href="http://localhost/php_ecomm/admin/user/trashed.php"><i class="fas fa-trash-alt"></i> Trash</a>
            </div>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Options</th>
                    </tr>
                </tfoot>
                <tbody>
                    <?php for ($i = 0; $i < 53; $i++) { ?>
                        <tr>
                            <td>Tarun Chauhan<br> coding.tarun@gmail.com</td>
                            <td>Admin</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-primary">Status</button>
                                    <button type="button" class="btn btn-secondary"><i class="fas fa-edit"></i> Edit</button>
                                    <button type="button" class="btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>