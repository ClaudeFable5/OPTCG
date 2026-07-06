-- AUTO-GENERATED: OP12-022 / 이누아라시
-- rules_id=OP12-022 script_id=880001475 fingerprint=0c05108ee32cf2c0214ed064511d2002f4486ce70517c7fd731ac4e440ce9cae
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-022]],
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
                cost_lte=5,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 레스트 상태이고 코스트 5 이하인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-022]],
    schema_version=1,
  })
end
