-- AUTO-GENERATED: OP12-061 / 돈키호테 로시난테
-- rules_id=OP12-061 script_id=880001514 fingerprint=e8e11e4696676029e021f26e0f2776dd4c17d6b3ebd8980b4737b0e46d3fe14e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                count=1,
                op=[[TAKE_LIFE_TO_HAND]],
                position=[[TOP]],
              },
            },
            selector={
              count=0,
              filter={
                name=[[트라팔가 로]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 「트라팔가 로」가 KO 당할 경우, 대신 자신의 라이프 위에서 1장을 패에 더할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
              cost_gte=4,
              name=[[트라팔가 로]],
            },
            op=[[MODIFY_NEXT_PLAY_COST]],
            player=[[YOU]],
            uses=1,
            zone=[[HAND]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-1: 이번 턴 동안, 다음에 자신이 패에서 등장시키는 코스트 4 이상인 「트라팔가 로」의 지불 코스트는 2 적어진다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-061]],
    schema_version=1,
  })
end
