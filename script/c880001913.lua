-- AUTO-GENERATED: ST13-014 / 몽키 D. 루피
-- rules_id=ST13-014 script_id=880001913 fingerprint=b42907afba16a5814f1d8016c0f1d3da961988c6c624f971ac3d553043894874
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
              name=[[몽키 D. 루피]],
            },
            op=[[PLAY_FROM_LIFE_TOP]],
            player=[[YOU]],
            rested=false,
            reveal=true,
          },
          {
            actions={
              {
                amount=2000,
                duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[LEADER]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            conditions={
              {
                op=[[LAST_ACTION_SUCCEEDED]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 라이프 위에서 1장을 공개하고, 그 카드가 코스트 5인 「몽키 D. 루피」인 경우, 등장시킬 수 있다. 등장시킨 경우, 다음 상대의 턴 종료 시까지, 자신의 리더 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-014]],
    schema_version=1,
  })
end
