-- AUTO-GENERATED: EB02-015 / 쥬얼리 보니
-- rules_id=EB02-015 script_id=880000076 fingerprint=fca9102cad45374ba49dacd02dc7d5c8c94e244656ad75b503ab0db3c2ce87a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 레스트 상태인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다. 그 후, 이번 턴 종료 시, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-015]],
    schema_version=1,
  })
end
