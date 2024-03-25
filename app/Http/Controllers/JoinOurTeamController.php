<?php

namespace App\Http\Controllers;

use App\Enums\JoinOurTeamEnums;
use App\Http\Requests\JoinOurTeamRequest;
use App\Models\JoinOurTeam;
use Illuminate\Http\Request;

class JoinOurTeamController extends Controller
{

    public function index()
    {
        $joinOurTeam = JoinOurTeam::paginate(10);

        return $this->successResponse(
            $joinOurTeam,
            'dataFetchedSuccessfully'
        );
    }

    public function get_jobs()
    {
        return $this->successResponse(
            JoinOurTeamEnums::getValues(),
            'dataFetchedSuccessfully'
        );
    }

    public function create()
    {
    }

    public function store(JoinOurTeamRequest $request)
    {
        $joinOurTeam =  JoinOurTeam::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'job' => $request->job,
        ]);

        return $this->successResponse(
            $joinOurTeam,
            'dataAddedSuccessfully'
        );
    }

    public function show(JoinOurTeam $joinOurTeam)
    {
    }

    public function edit(JoinOurTeam $joinOurTeam)
    {
    }

    public function update(JoinOurTeamRequest $request, JoinOurTeam $joinOurTeam)
    {
        $joinOurTeam =  JoinOurTeam::find($request->id);

        $joinOurTeam->name = $request->name ?? $joinOurTeam->name;
        $joinOurTeam->phone = $request->phone ?? $joinOurTeam->phone;
        $joinOurTeam->job = $request->job ?? $joinOurTeam->job;

        $joinOurTeam->save();

        return $this->successResponse(
            $joinOurTeam,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($id)
    {

        $joinOurTeam =  JoinOurTeam::find($id);

        if ($joinOurTeam) {
            JoinOurTeam::destroy($id);
            return $this->successResponse(
                null,
                'dataDeletedSuccessfully'
            );
        }

        return $this->errorResponse(
            'not_found',
            404
        );
    }
}
