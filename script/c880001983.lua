-- AUTO-GENERATED: ST24-004 / 로 & 베포
-- rules_id=ST24-004 script_id=880001983 fingerprint=9669724560bae2dfa2a6b079a2eb0947c1d382cb1075603eb136dd19d13aeec0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST24-004]],
    compile_status=[[AUTO]],
    effects={
      {
        -- [공식 Q&A Q919 2026-05-22, 유저 반영 2026-08-15] 상대 액티브 캐릭터가
        -- 0장(레스트할 대상 없음)이어도 ①상대 캐릭터 1장까지는 다음 상대
        -- 리프레시에 액티브 안 됨 ②레스트 2장 이상이면 리더 +2000 은 각각
        -- 성립한다 - "그 후"는 순차일 뿐 종속(then)이 아니다. 종전엔 REST
        -- 실패 시 뒤 액션이 전부 불발했다. 동결 대상은 REST를 했으면 그
        -- 카드(LAST_TARGET), 못 했으면 상대의 레스트 캐릭터 1장까지 선택.
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            actions={
              {
                duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
                op=[[CANNOT_SET_ACTIVE]],
                selector={
                  count=1,
                  kind=[[LAST_TARGET]],
                  mode=[[UP_TO]],
                  owner=[[CONTEXT]],
                },
              },
            },
            conditions={
              {
                op=[[LAST_ACTION_SUCCEEDED]],
              },
            },
            op=[[IF]],
            otherwise={
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
            },
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
                count=2,
                filter={
                  state=[[RESTED]],
                },
                op=[[CHARACTER_COUNT_GTE]],
                player=[[OPPONENT]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 1장까지를 레스트로 하고, 그 캐릭터는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다. 그 후, 상대의 레스트 상태인 캐릭터 2장 이상인 경우, 다음 상대의 엔드 페이즈 종료 시까지, 자신의 리더의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST24-004]],
    schema_version=1,
  })
end
