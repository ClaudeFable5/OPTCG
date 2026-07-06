-- AUTO-GENERATED: EB02-021 / 고무고무 거인의 총
-- rules_id=EB02-021 script_id=880000082 fingerprint=1eec3b450b40896639b7fdf5062732c39fb066eef6f3ba9ab2d48f394d92d546
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=6000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[UNTIL_YOUR_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 자신의 《밀짚모자 일당》 특징을 가진 캐릭터 1장까지의 파워 +6000. 그 후, 선택한 캐릭터는 다음 자신의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-021]],
    schema_version=1,
  })
end
